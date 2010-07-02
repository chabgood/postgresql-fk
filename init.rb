require File.dirname(__FILE__) + '/lib/postgresql_fk_plugin'
ActiveRecord::Base.send(:include, ActiveRecord::PostgreSql_fk)