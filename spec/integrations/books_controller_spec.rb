require 'spec_helper'

describe 'books controller', type: :feature do
  include MyApp::IntegrationTest

  before :all do
    @valid_params = {
      title: "TITLE",
    }
    @valid_posted = @valid_params
  end

  describe 'index' do
    it 'should show list of books' do
      Book.create!(@valid_posted)
      visit "/books"
      expect(page).to have_content("TITLE")
    end
  end

  describe 'show' do
    it 'should show a book' do
      book = Book.create!(@valid_posted)
      visit "/books/#{book.id}"
      expect(page).to have_content("TITLE")
    end
  end

  describe 'new' do
    it 'should show a form' do
      visit "/books/new"
      expect(page).to have_content("Title")
    end
  end

  describe 'create' do
    context 'when the params are valid' do
      it 'should create a book' do
        visit "/books/new"
        fill_in "title", with: "TITLE"
        click_button "Save"
        expect(page.current_path).to match(%r{\A/books/(\d+)\z})
      end
    end

    context 'when the params are not valid' do
      it 'should not create a book' do
        visit "/books/new"
        click_button "Save"
        expect(page.current_path).to eq("/books")
      end
    end
  end

  describe 'edit' do
    context 'when the params are valid' do
      it 'should update the book' do
        book = Book.create!(@valid_posted)
        visit "/books/#{book.id}/edit"
        fill_in "title", with: "TITLE2"
        click_button "Save"
        expect(page).to have_content("TITLE2")
        expect(page.current_path).to eq("/books/#{book.id}")
      end
    end

    context 'when the params are not valid' do
      it 'should not update the book' do
        book = Book.create!(@valid_posted)
        visit "/books/#{book.id}/edit"
        fill_in "title", with: ""
        click_button "Save"
        expect(page.current_path).to eq("/books/#{book.id}")
      end
    end
  end

  describe 'destroy' do
    it 'should destroy a book', js: true do
      book = Book.create!(@valid_posted)
      visit "/books/#{book.id}"
      page.accept_confirm 'Are you sure?' do
        click_link "Delete"
      end
      expect(page.current_path).to eq("/books")
      expect(Book.find_by(id: book.id)).to be_nil
    end
  end
end
