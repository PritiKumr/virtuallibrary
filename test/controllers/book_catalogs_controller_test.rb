require 'test_helper'

class BookCatalogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_catalog = book_catalogs(:one)
  end

  test "should get index" do
    get book_catalogs_url
    assert_response :success
  end

  test "should get new" do
    get new_book_catalog_url
    assert_response :success
  end

  test "should create book_catalog" do
    assert_difference('BookCatalog.count') do
      post book_catalogs_url, params: { book_catalog: { book_id: @book_catalog.book_id, catalog: @book_catalog.catalog } }
    end

    assert_redirected_to book_catalog_url(BookCatalog.last)
  end

  test "should show book_catalog" do
    get book_catalog_url(@book_catalog)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_catalog_url(@book_catalog)
    assert_response :success
  end

  test "should update book_catalog" do
    patch book_catalog_url(@book_catalog), params: { book_catalog: { book_id: @book_catalog.book_id, catalog: @book_catalog.catalog } }
    assert_redirected_to book_catalog_url(@book_catalog)
  end

  test "should destroy book_catalog" do
    assert_difference('BookCatalog.count', -1) do
      delete book_catalog_url(@book_catalog)
    end

    assert_redirected_to book_catalogs_url
  end
end
