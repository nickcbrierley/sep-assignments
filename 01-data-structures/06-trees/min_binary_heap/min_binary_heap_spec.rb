require 'rspec/autorun'
include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { MinBinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, pacific_rim)
      expect(tree.root.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, pacific_rim)
      expect(tree.root.left.title).to eq "The Matrix"
    end
    
    it "properly inserts a new node as a left-left child" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.left.left.title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.root.right.title).to eq "Inception"
    end
    
    it "properly inserts a new node as a right child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      expect(tree.root.right.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      expect(tree.root.right.left.title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, empire)
      expect(tree.root.right.right.title).to eq "Star Wars: The Empire Strikes Back"
    end
  end

  describe "#find" do
    it "should find the proper node" do
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      expect(tree.find(tree.root, inception.title).title).to eq("Inception")
    end

    it "should find the left node" do
      tree.insert(tree.root, pacific_rim)
      expect(tree.find(tree.root, pacific_rim.title).title).to eq("Pacific Rim")
    end
  end

  describe "#delete" do
    it "should find and delete the proper node" do
      tree.insert(tree.root, inception)
      tree.delete(tree.root, inception.title)
      expect(tree.find(tree.root, inception.title)).to eq(nil)
    end
  end

  describe "#print" do
    specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nInception: 86\nThe Matrix: 87\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\n"

       tree.insert(tree.root, hope)
       tree.insert(tree.root, empire)
       tree.insert(tree.root, jedi)
       tree.insert(tree.root, martian)
       tree.insert(tree.root, pacific_rim)
       tree.insert(tree.root, inception)

       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end