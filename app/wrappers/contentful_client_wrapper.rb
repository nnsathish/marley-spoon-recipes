class ContentfulClientWrapper
  attr_reader :client, :options

  def initialize(options = {})
    @options = options.reverse_merge(client_options: {})
    client_opts = default_client_options.merge(self.options[:client_options]) # allow customization
    @client ||= ::Contentful::Client.new(client_opts)
  end

  def recipes(include_level = 1)
    self.client.entries(content_type: 'recipe', include: include_level)
  end

  def recipe(id)
    self.client.entry(id)
  end

  private

  def default_client_options
    contentful_creds = Rails.application.credentials.contentful
    {
      space: contentful_creds[:space_id],
      access_token: contentful_creds[:access_token],
      environment: contentful_creds[:env],
      entry_mapping: client_entry_mapping,
      dynamic_entries: :auto,
      max_include_resolution_depth: 2,
      reuse_entries: true,
      timeout_connect: 2,
      timeout_write: 20,
      timeout_read: 5,
      logger: Rails.logger
    }
  end

  def client_entry_mapping
    {
      'recipe' => RecipeWrapper
    }
  end
end
