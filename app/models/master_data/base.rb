# frozen_string_literal: true

module MasterData
  class Base < ActiveYaml::Base
    set_root_path Rails.root.join('master_data')
  end
end
