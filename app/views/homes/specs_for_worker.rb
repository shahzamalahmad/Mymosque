require 'rails_helper'

RSpec.describe BxBlockAssessment::GenerateTemplateAsync, type: :worker do
  let(:age_group) {FactoryBot.create(:age_group)}
  let(:grade) { FactoryBot.create(:grade, age_group_id: age_group.id) }

  describe '#perform' do
    context 'when grade is found' do
      it 'attaches the assessment template' do
        expect_any_instance_of(BxBlockQuestionBank::Grade).to receive(:assessment_template).and_return(double(:attachment, attach: true))
        described_class.new.perform(grade.id)
      end
    end

    context 'when grade is not found' do
      it 'skips async template generation' do
        expect { described_class.new.perform(nil) }.to output(/Grade not found/).to_stdout
      end
    end
  end
end
