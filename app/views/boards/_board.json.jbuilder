json.extract! board, :id, :title, :creator_name, :del_passwd, :created_at, :updated_at
json.url board_url(board, format: :json)
