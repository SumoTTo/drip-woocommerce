Feature: Cart Interactions

  I want cart events to trigger a webhook.

  Scenario: Nothing happens when not logged in
    Given I have a product
      And I have set up a cart webhook
    When I add it to a cart
    Then No webhook is sent
    When I remove it from the cart
    Then No webhook is sent
    When I restore it to the cart
    Then No webhook is sent

  Scenario: Adding a product to a cart
    Given I have a product
      And I have a logged in user
      And I have set up a cart webhook
    When I add it to a cart
    Then I get sent a webhook

  Scenario: Removing a product from a cart
    Given I have a product
      And I have a logged in user
      And I have set up a cart webhook
      And I add it to a cart
    When I remove it from the cart
    Then I get sent a webhook with an empty cart

  Scenario: Restoring a product
    Given I have a product
      And I have a logged in user
      And I have set up a cart webhook
      And I add it to a cart
      And I remove it from the cart
    When I restore it to the cart
    Then I get sent a webhook

  Scenario: Increasing the quantity of a product
    Given I have a product
      And I have a logged in user
      And I have set up a cart webhook
      And I add it to a cart
    When I increase the quantity in the cart
    Then I get sent an updated webhook    

  Scenario: Setting the quantity of a product to zero
    Given I have a product
      And I have a logged in user
      And I have set up a cart webhook
      And I add it to a cart
    When I decrease the quantity in the cart to zero
    Then I get sent a webhook with an empty cart
