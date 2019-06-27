module Lti
  class ToolConfiguration
    include Rails.application.routes.url_helpers

    SCOPES = [
      "https://purl.imsglobal.org/spec/lti-ags/scope/lineitem",
      "https://purl.imsglobal.org/spec/lti-ags/scope/result.readonly",
      "https://purl.imsglobal.org/spec/lti-ags/scope/score",
      "https://purl.imsglobal.org/spec/lti-nrps/scope/contextmembership.readonly"
    ].freeze

    def initialize(host, protocol, platform)
      @host = host
      @protocol = protocol
      @platform = platform
    end

    def as_json
      {
        "title" => "Gist Submit",
        "scopes"=> SCOPES,
        "extensions"=>
         [{"domain" => "#{@protocol}#{@host}",
           "tool_id" => "Gist Submit",
           "platform" => "canvas.instructure.com",
           "settings"=>
            {"text" => "Gist Submit",
             "icon_url" => "https://cdn3.iconfinder.com/data/icons/social-icons-24/24/Github-512.png",
             "placements"=>
              [{"text" => "Gist Submit",
                "enabled"=>true,
                "icon_url" => "https://cdn3.iconfinder.com/data/icons/social-icons-24/24/Github-512.png",
                "placement" => "course_navigation",
                "message_type" => "LtiResourceLinkRequest",
                "target_link_uri"=> course_navigation_url(host: @host),
                "canvas_icon_class" => "icon-lti"},
               {"text" => "Gist Submit",
                "enabled"=>true,
                "icon_url" => "https://cdn3.iconfinder.com/data/icons/social-icons-24/24/Github-512.png",
                "placement" => "assignment_selection",
                "message_type" => "LtiResourceLinkRequest",
                "target_link_uri" => assignment_selection_url(host: @host),
                "canvas_icon_class" => "icon-lti"}],
             "selection_width"=>500,
             "selection_height"=>500},
           "privacy_level" => "public"}],
        "public_jwk"=> Rails.application.credentials.developement.dig(:key_pair, :public_key),
        "description" => "Uste GitHub Gists as assignment submissions",
        "custom_fields"=> {
          "lti_assignment_id" => "$com.instructure.Assignment.lti.id",
          "assignment_title" => "$Canvas.assignment.title",
          "lti_course_id" => "$vnd.instructure.Course.uuid",
          "assignment_due_date" => "$Canvas.assignment.dueAt",
          "canvas_course_id" => "$Canvas.course.id"
        },
        "target_link_uri" => resource_link_url(host: @host),
        "oidc_initiation_url" => login_url(host: @host)
        }
    end

    def to_json(opts)
      as_json.to_json
    end
  end
end