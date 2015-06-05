module SimpleSpotify
  module Actions
    module Users

      def me
        Model::User.new (get :me).body
      end


      def user id
        Model::User.new (get "user/#{id}").body
      end


      #--------------
      # Follows
      #--------------
      def user_follow type, ids
        if ids.is_a? Array
          ids.map { |i|
            i.is_a?(Resource) ? i.id : i;
          }.join(',')
        end

        req = SimpleSpotify::Request.new("me/following", {
          json: true,
          query: {type: type},
          data: {ids: ids},
          method: :put
        })

        put req
      end


      def user_unfollow type, ids
        if ids.is_a? Array
          ids.map { |i|
            i.is_a?(Resource) ? i.id : i;
          }.join(',')
        end

        req = SimpleSpotify::Request.new("me/following", {
          json: true,
          query: {type: type},
          data: {ids: ids},
          method: :delete
        })

        delete req
      end


      def user_following type, ids
        if ids.is_a? Array
          ids.map { |i|
            i.is_a?(Resource) ? i.id : i;
          }.join(',')
        end

        res = get "me/following/contains", {ids: ids, type: type}
        ids.zip(res.body).to_h
      end


    end
  end
end