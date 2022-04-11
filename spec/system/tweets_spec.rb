require 'rails_helper'

RSpec.describe "Tweets", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @tweet_image = Faker::Lorem.sentence
    @tweet_text = Faker::Lorem.sentence
  end

  context 'ツイート投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿ができる' do
      #ログインできる
        visit new_user_session_path
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        find('input[name = "commit]').click
        expect(current_path).to have_content('投稿する')
      #新規投稿ページへのボタンがある
        expect(page).to have_content('投稿する')
      #投稿ページに移動する
        visit new_tweet_path
      #フォームに情報を入力する
        
      #送信するとTweetモデルのカウントが１上がる
      #投稿完了ページに遷移する
      #トップページに先ほど投稿した内容のツイートが存在する（画像）
      #トップページに先ほど投稿した内容のツイートが存在する（テキスト）
    end
  end

  context 'ツイートが投稿できないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない'
      #トップページに遷移する
      #新規投稿ページのボタンがないことを確認する
    end
  end

  pending "add some scenarios (or delete) #{__FILE__}"
end
