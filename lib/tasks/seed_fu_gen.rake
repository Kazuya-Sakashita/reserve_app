namespace :seed_fu_gen do
  namespace :seed_fu_gen do
    desc 'generate seed-fu file for plan.'
    task plan: :environment do |_t|
      SeedFu::Writer.write('./db/fixtures/plan_gen.rb', class_name: 'plan', constraints: [:plan_id]) do |w|
        Plan.all.each do |x|
          w << x.as_json(except: [:created_at, :updated_at])
        end
      end
    end
  end
end
