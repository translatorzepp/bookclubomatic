require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  render_views

  context "it only allows whitelisted params" do
    it "requires a book" do
    end

    it "permits a voter name" do
    end

    it "does not permit other params" do
    end
  end

  context "book" do
    it "creates a book" do
      expect{ post :create, :params => {:book => {:title => "Ancillary Justice"}} }.to change{ Book.all.count }.by(1)
      book = Book.find_by(:title => "Ancillary Justice")
      expect(book.title).to eq("Ancillary Justice")
    end

    it "redirects to the index page after creation" do
      post :create, :params => {:book => {:title => "Ancillary Justice"}}
      expect(response.get_header("Location").end_with?("/books")).to be true
    end

    it "does not create a book without a title" do
      expect{ post :create, :params => {:book => {}} }.to raise_error(ActionController::ParameterMissing)
    end

    it "deletes a book" do
      # post :create, :params => {:book => {:title => "Ancillary Justice"}}
      # book = Book.find_by(:title => "Ancillary Justice")
      # expect{ delete :destroy, :params => {:book => {:id  => book.id}} }.to change{ Book.all.count }.by(-1)
      # expect(response.get_header("Location").end_with?("/books")).to be true
    end
  end

  context "votes" do
    it "votes for a book" do
    end

    it "does not vote for a book without a voter_name" do
    end

    it "unvotes for a book" do
    end
  end

  context "book with votes" do
    it "does not delete a book with votes" do
    end
  end
end
