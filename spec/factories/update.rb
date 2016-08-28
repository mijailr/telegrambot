FactoryGirl.define do
  factory :update_command, class: Hash do
    defaults = {"update_id"=>113110657, "message"=>{"message_id"=>12175, "from"=>{"id"=>107699231, "first_name"=>"Mijail", "last_name"=>"Rondon", "username"=>"MijailR"}, "chat"=>{"id"=>107699231, "first_name"=>"Mijail", "last_name"=>"Rondon", "username"=>"MijailR", "type"=>"private"}, "date"=>1472370400, "text"=>"/command many arguments", "entities"=>[{"type"=>"bot_command", "offset"=>0, "length"=>8}]}, "webhook"=>{"update_id"=>113110657, "message"=>{"message_id"=>12175, "from"=>{"id"=>107699231, "first_name"=>"Mijail", "last_name"=>"Rondon", "username"=>"MijailR"}, "chat"=>{"id"=>107699231, "first_name"=>"Mijail", "last_name"=>"Rondon", "username"=>"MijailR", "type"=>"private"}, "date"=>1472370400, "text"=>"/command many arguments", "entities"=>[{"type"=>"bot_command", "offset"=>0, "length"=>8}]}}}
    initialize_with {defaults.merge(attributes)}
    to_create {}
  end
  factory :update, class: Hash do
    defaults = {"update_id"=>113110647, "message"=>{"message_id"=>12165, "from"=>{"id"=>107699231, "first_name"=>"Mijail", "last_name"=>"Rondon", "username"=>"MijailR"}, "chat"=>{"id"=>107699231, "first_name"=>"Mijail", "last_name"=>"Rondon", "username"=>"MijailR", "type"=>"private"}, "date"=>1472369508, "text"=>"this is a message"}, "webhook"=>{"update_id"=>113110647, "message"=>{"message_id"=>12165, "from"=>{"id"=>107699231, "first_name"=>"Mijail", "last_name"=>"Rondon", "username"=>"MijailR"}, "chat"=>{"id"=>107699231, "first_name"=>"Mijail", "last_name"=>"Rondon", "username"=>"MijailR", "type"=>"private"}, "date"=>1472369508, "text"=>"this is a message"}}}

    initialize_with {defaults.merge(attributes)}
    to_create {}
  end
end
