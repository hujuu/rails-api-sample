class Api::V1::PostsController < ApplicationController
	def index
		posts = Post.all.order(created_at: :desc)
		posts_array = posts.map do |post|
			{
				id: post.id,
				content: post.content,
				tags: post.tags.map {|tag| {id: tag.id, name: tag.name}}
			}
		end
		render json: posts_array
	end
	
	def create
		post = Post.new(content: params[:content])
	# タグ入力、文字列を半角スペース区切りで入力することで配列に格納
		tags = params[:tags].split(' ')
		if post.save
			tags.each do |tag|
		      # tagsテーブルのnameカラムをpostsテーブルに紐付けて一つずつ作成
			  post_tag = post.tags.create(name: tag)
			end
		    # レスポンスで返ってくるJSON情報を設定
			post_list = {
				content: post.content,
				tags: tags
			}
			render json: post_list
		else
			render json: post_list.errors, status: 422
		end
	end
end
