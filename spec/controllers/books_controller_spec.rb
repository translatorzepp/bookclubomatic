require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  # render_views
  # subject { Book.new }

  context "book" do
    it "creates a book" do
      expect{ post :create, :params => {:book => {:title => "Ancillary Justice"}} }.to change{ Book.all.count }.by(1)
      book = Book.find_by(:title => "Ancillary Justice")
      expect(book.title).to eq("Ancillary Justice")
    end

    it "does not create a book without a title" do
      expect{ post :create, :params => {:book => {}} }.to raise_error(ActionController::ParameterMissing)
    end
  end

  context "votes" do

  end
end
