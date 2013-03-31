require 'spec_helper'
require_file 'honest_abe/repository/git'

module HonestAbe
  module Repository
    describe Git do
      describe "#initialize" do
        it "stores the url" do
          git_repo = Git.new('git@github.com')
          git_repo.url.should eql 'git@github.com'
        end

        it "stores the branch" do
          git_repo = Git.new('git@github.com', :develop)
          git_repo.branch.should eql :develop
        end

        it "has a default branch" do
          git_repo = Git.new('git@github.com')
          git_repo.branch.should eql :default
        end
      end
    end
  end
end
