require 'rails_helper'

describe NewsStore do
  before do
    @news_store = FactoryBot.build(:news_store)
  end
  describe 'データを保存' do
    context 'データの保存がうまくいかない時' do
      it 'titleがないとき' do
        @news_store.title = nil
        @news_store.valid?
        expect(@news_store.errors.full_messages).to include("Title can't be blank")
      end
      it 'categoryが空の時は登録できない' do
        @news_store.category = nil
        @news_store.valid?
        expect(@news_store.errors.full_messages).to include("Category can't be blank")
      end
      it 'urlが空の時は登録できない' do
        @news_store.url = nil
        @news_store.valid?
        expect(@news_store.errors.full_messages).to include("Url can't be blank")
      end
    end
  end
end