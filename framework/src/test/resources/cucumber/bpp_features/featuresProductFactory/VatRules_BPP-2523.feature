@ProductFactory @VatRules @HappyPath
Feature: Reference Data - Vat Rules - Create Record - BPP-2523
  As a Senior Product Setter
  I want to be able to create new VAT Rules records
  so that I can setup appropriate rules for use when selling Courses and Materials.

  Background:
    Given I execute "Log In" reusable step

  @Positive @Regression @P1 @CoveredWithApi #TC-1340
  Scenario: Add a New VAT Rule Using a Modal
    And I execute "create VAT Rule" reusable step