require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { author: @book.author, description: @book.description, genre: @book.genre, title: @book.title } }
    end

    assert_redirected_to books_url
  end

  test "should not create book when no title is given" do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { author: @book.author, description: @book.description, genre: @book.genre } }
    end
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, genre: @book.genre, title: @book.title } }
    assert_redirected_to books_url
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end

  test "should vote for book" do
    assert_difference('@book.votes.count') do
      post vote_book_path(@book), params: { voter_name: "Voter" }
    end
  end

  test "should destroy a vote for a book" do
    assert_difference('@book.votes.count', -1) do
      post unvote_book_path(@book), params: { voter_name: "Voter" }
    end
  end

  test "should not destroy a vote for a book" do
    assert_difference('@book.votes.count', -1) do
      post unvote_book_path(@book), params: { voter_name: "Voter" }
    end
  end

  # test "should not destroy book if it has a vote" do
  #   # vote for @book
  #   assert_no_difference('Book.count') do
  #     delete book_url(@book)
  #   end
  #
  #   assert_redirected_to books_url
  # end
end
