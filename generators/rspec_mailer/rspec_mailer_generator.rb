require 'rails_generator/generators/components/mailer/mailer_generator'

class RspecMailerGenerator < MailerGenerator

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_path, class_name

      # Model, spec, and fixture directories.
      m.directory File.join('app/models', class_path)
      m.directory File.join('app/views', file_path)
      m.directory File.join('spec/models', class_path)
      m.directory File.join('spec/fixtures', file_path)

      # Model class, spec and fixtures.
      m.template "mailer:mailer.rb",    File.join('app/models', class_path, "#{file_name}.rb")
      m.template "mailer_spec.rb", File.join('spec/models', class_path, "#{file_name}_spec.rb")

      # View template and fixture for each action.
      actions.each do |action|
        relative_path = File.join(file_path, action)
        view_path     = File.join('app/views', "#{relative_path}.erb")
        fixture_path  = File.join('spec/fixtures', relative_path)

        m.template "view.erb", view_path,
                   :assigns => { :action => action, :path => view_path }
        m.template "fixture.erb", fixture_path,
                   :assigns => { :action => action, :path => view_path }
      end
    end
  end
end
