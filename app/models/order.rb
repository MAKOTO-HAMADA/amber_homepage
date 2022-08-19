class Order < ApplicationRecord
    
    belongs_to :customer
    has_many :order_histories, dependent: :destroy
    
    ## enum定義
    enum payment_method: { credit_card: 0, transfer: 1, cashless: 2, cash_on_delivery: 3 }
    enum order_status: { waiting_for_payment: 0, paid: 1, preparing_to_ship: 2, shipped: 3 }
    # enumGemで指定カラムに対し[文字列]と[数字]を紐付ける
    # config/application.rb:21 で[文字列]を[日本語]に変換する
    # ※[日本語]と[数字]を直接紐付けるとActiveRecord::Enumの一部メソッドが使えなくなる状態になるため
    
    ## 配送先情報を代入するメソッド
    def substitute_hipping_information
        self.postal_code = self.customer.postal_code
        self.address     = self.customer.full_address
        self.name        = self.customer.full_name
    end
end
