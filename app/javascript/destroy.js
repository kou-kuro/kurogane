$('#favorite_buttons_<%= @article.id %>').html("<%= j(render partial: 'favorites/favorite', locals: { article: @article }) %>");
