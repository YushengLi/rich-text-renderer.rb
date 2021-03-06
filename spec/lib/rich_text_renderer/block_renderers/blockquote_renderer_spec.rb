require 'spec_helper'

mock_node = {"content" => [{"nodeType" => "paragraph", "content" => [{"value" => "foo", "nodeType" => "text"}]}]}

mock_node_with_marks = {"content" => [{"nodeType" => "paragraph", "content" => [{"value" => "foo", "nodeType" => "text", "marks" => [{"type" => "bold"}]}]}]}

describe RichTextRenderer::BlockQuoteRenderer do
  subject do
    described_class.new(
      'paragraph' => RichTextRenderer::ParagraphRenderer,
      'text' => RichTextRenderer::TextRenderer,
      'bold' => RichTextRenderer::BoldRenderer
    )
  end

  describe '#render' do
    it 'renders a blockquote' do
      expect(subject.render(mock_node)).to eq "<blockquote><p>foo</p></blockquote>"
    end

    it 'will propagate marks to text renderers' do
      expect(subject.render(mock_node_with_marks)).to eq "<blockquote><p><b>foo</b></p></blockquote>"
    end
  end
end
