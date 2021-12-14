class UserAndItems < ActiveRecord::Migration[6.1]
  def up
    User.create!(
      name: random,
      email: "#{random}@example.com",
      password: random,
      token: random
    )
    %w(歯磨き粉 歯ブラシ 入浴剤 化粧水 ハンドクリーム キャンドル キャンドルホルダー アロマオイル(ラベンダー) アロマオイル(ネロリ) マッチ).each_with_index do |name, i|
      Item.create!(name: name, price: (i + rand(1..6)) * 100)
    end
  end

  def down
    User.destroy_all
    Item.destroy_all
  end

  private

  def random
    SecureRandom.alphanumeric(4)
  end
end
