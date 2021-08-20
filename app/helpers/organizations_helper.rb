module OrganizationsHelper
  def dynamic_submit(form)
    if params[:action] == 'new'
      form.submit('Create And Join Organization')
    else
      form.submit('Update Organization')
    end
  end
end
