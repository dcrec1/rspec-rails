require File.expand_path(File.dirname(__FILE__) + '<%= '/..' * class_nesting_depth %>/../spec_helper')

describe <%= class_name %> do
  <% for action in actions -%>

  context "on <%=action%>" do

  end
  <% end -%>
end
