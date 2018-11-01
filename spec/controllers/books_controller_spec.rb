require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

  # context "it only allows whitelisted params" do
  #   it "requires a book" do
  #   end
  #
  #   it "permits a voter name" do
  #   end
  #
  #   it "does not permit other params" do
  #   end
  # end

  context "new book" do
    it "creates a book" do
      expect{ post :create, :params => {:book => {:title => "Ancillary Justice"}} }.to change{ Book.all.count }.by(1)
      book = Book.find_by(:title => "Ancillary Justice")
      expect(book.title).to eq("Ancillary Justice")
    end

    it "redirects to the index page after creation" do
      post :create, :params => {:book => {:title => "Ancillary Justice"}}
      expect(response).to redirect_to(books_url)
    end

    it "does not create a book without a title" do
      expect{ post :create, :params => {:book => {}} }.to raise_error(ActionController::ParameterMissing)
    end
  end

  context "existing book" do

    before :each do
      post :create, :params => {:book => {:title => "Ancillary Justice"}}
      @book = Book.find_by(:title => "Ancillary Justice")
    end

    it "shows a book" do
      get :show, :params => {:id => @book.id}
      expect(response).to be_successful
    end

    it "deletes a book" do
      expect{ delete :destroy, :params => {:id => @book.id} }.to change{ Book.all.count }.by(-1)
    end

    it "votes for a book" do
      expect{ post :vote, :params => {:voter_name => "Breq", :id => @book.id} }.to change{ @book.votes.count }.by(1)
    end

    it "does not vote for a book without a voter_name" do
      expect{ post :vote, :params => {:id => @book.id} }.to change{ @book.votes.count }.by(0)
      expect{ post :vote, :params => {:voter_id => nil, :id => @book.id} }.to change{ @book.votes.count }.by(0)
    end

    it "unvotes for a book" do
      post :vote, :params => {:voter_name => "Breq", :id => @book.id}
      expect{ post :unvote, :params => {:voter_name => "Breq", :id => @book.id} }.to change{ @book.votes.count }.by(-1)
      #doesn't work because unvote doesn't take a voter_name; it looks it up via the session. let's inject that dependency by having something else set :voter_name as the session_id
    end

    it "does not delete a book with votes" do
      post :vote, :params => {:voter_name => "Breq", :id => @book.id}
      expect{ delete :destroy, :params => {:id => @book.id} }.to change{ Book.all.count }.by(0)
      delete :destroy, :params => {:id => @book.id}
      expect(flash[:notice]).to eq("Cannot delete a book that has been voted for!")
    end
  end

end
