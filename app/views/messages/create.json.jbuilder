json.message    @message.message
json.group_id   @message.id
json.user_id    @message.user.id
json.name       @message.user.name
json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.image      @message.image_url(:thumb)
