class Category < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '株' },
      { id: 3, name: '投信' },
      { id: 4, name: '債券' },
      { id: 5, name: '不動産' },
      { id: 6, name: 'ESG' },
      { id: 7, name: 'その他' }
    ]
  end
