module AnswersHelper
  def hide_answer_if(condition, attributes = {},  &block)
    if condition
      attributes["style"]= "display:none"
    end
    content_tag("div",attributes, &block)
  end
end
