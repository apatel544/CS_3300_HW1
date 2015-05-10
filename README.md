##CS 3300 Software Engineering
###Homework 1

#####Ruby calisthenics

Due Sunday, February 8th at 11:59pm

First, download the Code skeleton required for this homework.

The goal of this multi-part assignment is to get you accustomed to basic Ruby coding and introduce you to RSpec, the unit testing tool we will be using heavily throughout the semester.
While we provide an explanation of how your code should work in this handout, you should get accustomed to the idea that the true specification is in the test files!
Therefore, we suggest you work on this assignment using autotest, which automatically re-runs all the RSpec tests each time you make changes to your code:

1. Download the Code skeleton. To untar it, `tar -xvf Skeleton.tar.gz` (see http://www.cyberciti.biz/faq/linux-unix-bsd-extract-targz-file/ for details about tar if you’ve never seen it.)
2. Double check your environment- You will need to install ruby 1.9.3 if it is not already on your system. We suggest using rvm to handle ruby as we will be using several ruby versions in this class.

  > gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 \\curl -sSL https://get.rvm.io | bash -s stable

  Documentation: https://rvm.io/rvm/basics

3. `rvm use ruby 1.9.3`
4. Install bundler:  `gem install bundler`
5. run `bundle install` from the root project directory (where `Gemfile`, `lib/`, and `spec/` reside)- this will install all of the correct gem versions.
6. Now you need to run all your gem commands prefixed with `bundle exec` (i.e. `autotest`, `rspec`, `rails`, ...). This will make sure the correct gems are being used.
7. In a terminal window, change to the root directory of this homework (the one containing subdirectories `lib/` and `spec/`) and run the command `bundle exec autotest`. RSpec expects to find code files under `lib/` and the corresponding spec files under `spec/`.
8. Initially, all tests are marked "pending", as indicated by the argument `:pending => true` in each `describe` block. To start working on a question, remove this option:
  * e.g. in fun_with_strings_spec.rb, change:
    `describe 'palindrome detection', :pending => true do`
    to:
    `describe 'palindrome detection' do`
    and save the spec file. autotest will detect the change and automatically re-run the tests in that group, which will now fail (displayed in red) since you haven't written any code yet.
9. As you fill in code in the appropriate files under `lib/`, each time you save changes to that file the tests will automatically be re-run. When a test passes, it's displayed in green. Your goal is to get all tests for all parts to pass green.
10. To end autotest, hit `Ctrl-C` twice  (We recommend that you write your code in one window/tab and keep autotest running in the other until you are done with your edits.  Autotest will automatically run every time you save your code.)

  (Note: when you submit your assignment, we will also run additional test cases beyond the ones given here.)

  To help you get started, check out this video by Samuel Joseph at Hawaii Pacific University: https://www.youtube.com/watch?v=bII2Nxc6po4

  In this homework, you will do some simple programming exercises to get familiar with the Ruby language.  We will provide detailed automatic and personalized grading of your code.
  **Skeleton code is provided (Code skeleton) for each part! Start with the skeleton code and read the comments carefully.**
  The information needed for this assignment will be covered this week in class.  I encourage you to read ahead and get started on this assignment early!

  NOTE:  For all questions involving words or strings, you may assume that the definition of a "word" is "a sequence of characters whose boundaries are matched by the `\b` construct in Ruby regexps."

######Part 1: Fun with Strings

Specs: `spec/fun_with_strings_spec.rb`
In this problem, you'll implement three functions that perform basic string processing. You can start from the template `fun_with_strings.rb`

**Palindromes**
* A palindrome is a word or phrase that reads the same forwards as backwards, ignoring case, punctuation, and nonword characters. (A "nonword character" is defined for our purposes as "a character that Ruby regular expressions would treat as a nonword character".)
* You will write a method `palindrome?` that returns `true` if and only if its receiver is a palindrome.
* As you can see in the template `fun_with_strings.rb`, we arrange to mix your method into the `String` class so it can be called like this:

  > "redivider".palindrome?

  >  true

  > "adam".palindrome?

  > false

* Your solution shouldn't use loops or iteration of any kind. Instead, you will find regular-expression syntax very useful; it's reviewed briefly in the book, and the website http://rubular.com lets you try out Ruby regular expressions "live". Some methods that you might find useful (which you'll have to look up in Ruby documentation, http://ruby-doc.org) include:  `String#downcase`, `String#gsub`, `String#reverse`.
* The `spec` file contains a number of test cases. At a minimum, all should pass before you submit your code. We will run additional cases as well.

**Word Count**
* Define a function `count_words` that, given an input string, return a hash whose keys are words in the string and whose values are the number of times each word appears:

  > "To be or not to be"

  > {"to"=>2, "be"=>2, "or"=>1, "not"=>1}

* Your solution shouldn't use for-loops, but iterators like each are permitted. As before, nonwords and case should be ignored. A word is defined as a string of characters between word boundaries.

**Anagrams**
* An anagram group is a group of words such that any one can be converted into any other just by rearranging the letters. For example, "rats", "tars" and "star" are an anagram group.
* Given a space separated list of words in a single string, write a method that groups them into anagram groups and returns the array of groups. Case doesn't matter in classifying string as anagrams (but case should be preserved in the output), and the order of the anagrams in the groups doesn't matter.

######Part 2: Basic Object-Oriented Programming for Dessert

Specs: `spec/dessert_spec.rb`

* Create a class `Dessert` with getters and setters for `name` and `calories`. The constructor should accept arguments for `name` and `calories`.
* Define instance methods `healthy?`, which returns `true` if and only if a dessert has less than 200 calories, and `delicious?`, which returns true for all desserts.
* Create a class `JellyBean` that inherits from `Dessert`. The constructor should accept a single argument giving the jelly bean's flavor; a newly-created jelly bean should have 5 calories and its name should be the flavor plus "jelly bean", for example, "strawberry jelly bean".
* Add a getter and setter for the `flavor`.
* Modify `delicious?` to return `false` if the `flavor` is "licorice", but `true` for all other flavors. The behavior of `delicious?` for non-jelly-bean desserts should be unchanged.

######Part 3: Rock Paper Scissors

Specs: `spec/rock_paper_scissors_spec.rb`

* In a game of rock-paper-scissors, each player chooses to play Rock (R), Paper (P), or Scissors (S). The rules are: Rock breaks Scissors, Scissors cuts Paper, but Paper covers Rock. (In other words, Rock wins over Scissors, Scissors wins over Paper, and Paper wins over Rock.)
  In a round of rock-paper-scissors, each player's name and strategy is encoded as an array of two elements

  > [ ["Kristen", "P"], ["Jacob", "S"] ] # Jacob would win since S > P

* Game Winner:
  * Create a `RockPaperScissors` class with a class method `winner` that takes two 2-element arrays like those above, and returns the one representing the winner:

    > RockPaperScissors.winner(['Kristen,'P'], ['Jacob','S'])

    > ['Jacob','S']

  * If either player's strategy is something other than "R", "P" or "S" (case-insensitive), the method should raise a `RockPaperScissors::NoSuchStrategyError` exception.
  * If both players use the same strategy, the first player is the winner.
* Tournament:
  * A rock-paper-scissors tournament is encoded as an array of games - that is, each element can be considered its own tournament.

    ```Ruby
    [
       [
           [ ["Kristen", "P"], ["Ben", "S"] ],
           [ ["Justin", "R"],  ["Walter", "S"] ],
       ],
       [
           [ ["Allen", "S"], ["Omer", "P"] ],
           [ ["David", "R"], ["Richard", "P"] ]
       ]
    ]
    ```

  * In the tournament above Kristen will always play "P" and Ben will always play "S". This tournament plays out as follows:
    * Under this scenario, Ben would beat Kristen (`S>P`) and Justin would beat Walter (`R>S`), so Ben and Justin would play (Justin wins since `R>S`); similarly, Allen would beat Omer, Richard  would beat David, and Allen and Richard would play (Allen wins since `S>P`); and finally Justin would beat Allen since `R>S`. That is, pairwise play continues until there is only a single winner.
  * Write a method `RockPaperScissors.tournament_winner` that takes a tournament encoded as an array and returns the winner (for the above example, it should return `['Justin', 'R']`). You can assume that the array is well formed (that is, there are `2n` players, and each one participates in exactly one match per round).
  * HINT: Formulate the problem as a recursive one whose base case you solved in part A.

######Part 4: Ruby Metaprogramming

`Specs: spec/attr_accessor_with_history_spec.rb`

* In lecture we saw how `attr_accessor` uses metaprogramming to create getters and setters for object attributes on the fly.
* Define a method `attr_accessor_with_history` that provides the same functionality as `attr_accessor` but also tracks every value the attribute has ever had:

  ```Ruby
  class Foo
    attr_accessor_with_history :bar
  end
  ```

  > f = Foo.new

  > f.bar = 3

  > 3

  > f.bar = :wowzo

  > :wowzo

  > f.bar = 'boo!'

  > 'boo!'

  > f.bar_history

  > [nil, 3, :wowzo]

* (Calling `bar_history` before `bar`'s setter is ever called should return `nil`.)
* History of instance variables should be maintained separately for each object instance. that is:

  > f = Foo.new

  > f.bar = 1 ; f.bar = 2

  > g = Foo.new

  > g.bar = 3 ; g.bar = 4

  > g.bar_history

  then the last line should just return `[nil,3]`, rather than `[nil,1,3]`.
  * If you're interested in how the template works, the first thing to notice is that if we define `attr_accessor_with_history` in class `Class`, we can use it as in the snippet above. This is because a Ruby class like `Foo` or `String` is actually just an object of class `Class`. (If that makes your brain hurt, just don't worry about it for now. It'll come.)
  * The second thing to notice is that Ruby provides a method `class_eval` that takes a string and evaluates it in the context of the current class, that is, the class from which you're calling `attr_accessor_with_history`. This string will need to contain a method definition that implements a `setter-with-history` for the desired attribute `attr_name`.
  * HINTS:
    * Don't forget that the very first time the attribute receives a value, its history array will have to be initialized.
    * An attribute's initial value is always `nil` by default, so if `foo_history` is referenced before `foo` has ever been assigned, the correct answer is `nil`, but after the first assignment to `foo`, the correct value for `foo_history` would be `[nil]`.
    * Don't forget that instance variables are referred to as `@bar` within getters and setters, as Section 3.5 of the ESaaS textbook explains.
    * Although the existing `attr_accessor` can handle multiple arguments (e.g. `attr_accessor :foo, :bar`), your version just needs to handle a single argument.
    * Your implementation should be general enough to work in the context of any class and for attributes of any (legal) variable name

######Submission:

Submit each part as a separate `.rb` file in Blackboard. Name each file based on this: `youruccsID_part_partnumber_answer.rb`  (For example: `kjustice_part_1_answer.rb`) You should submit 4 files in total with your assignment.  YOU WILL BE PENALIZED IF YOU DO NOT FOLLOW THE REQUESTED NAMING STRUCTURE.
Each part will be weighted evenly when grading.
