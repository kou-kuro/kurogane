require 'rails_helper'

describe Article do
  before do
    @article = FactoryBot.build(:article)
  end
  describe '記事投稿' do
    context '投稿がうまく行く時' do
      it 'titleとdescriptionとcategory_idとimageがあれば投稿できる' do
        expect(@article).to be_valid
      end
    end
    context '投稿がうまくいかないとき' do
      it 'titleが空の時は投稿できない' do
        @article.title = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空の時は投稿できない' do
        @article.description = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空の時は投稿できない' do
        @article.category_id = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('Category is not a number')
      end
      it 'imageが空の時は投稿できない' do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが1の時は登録できない' do
        @article.category_id = 1
        @article.valid?
        expect(@article.errors.full_messages).to include('Category must be other than 1')
      end
    end
  end
end
