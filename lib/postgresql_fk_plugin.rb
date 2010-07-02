module ActiveRecord
	module PostgreSql_fk
		def self.included(base)
			 ActiveRecord::Migration.extend(ClassMethods)
		end
	end
end

module ClassMethods
	def add_foreign_key(from_table, from_column, to_table)
    constraint_name = "fk_#{from_table}_#{from_column}"
    
    execute %{ALTER TABLE #{from_table}
              ADD CONSTRAINT #{constraint_name}
              FOREIGN KEY (#{from_column})
              REFERENCES #{to_table}(id)}
  end
  
  def drop_foreign_key(from_table, from_column, to_table)
    constraint_name = "fk_#{from_table}_#{from_column}"
    
    execute %{ALTER TABLE #{from_table}
              DROP CONSTRAINT #{constraint_name}}
  end
end
