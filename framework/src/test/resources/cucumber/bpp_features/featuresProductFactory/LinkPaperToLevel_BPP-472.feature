@ProductFactory @LinkPaperToLevel
Feature: Reference Data - Link Paper To Level - BPP-472
  As a Senior Product Setter
  I need to be able to specify which Papers(Modules) are linked to a Level.
  (Relate Paper to a Level through "for Level" relationship)
  If a Paper is Linked to Body, only Levels related to same Body (Allowed Level) should be available/linked to.

  Background:
    Given I execute "Log In" reusable step
    And I execute "Create Level" reusable step
    And I execute "Create Paper" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-714
  Scenario: Link Paper to Level
    Given I execute "Link Paper to Level" reusable step