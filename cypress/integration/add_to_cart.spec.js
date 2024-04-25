describe('add-to-cart', () => {

  it('users can add item to cart and cart increases by one', () => {
    cy.visit("/");
    cy.get('.button_to').contains('Add')
      .first()
      .click({force: true});
    
    cy.get('.nav-link').contains('1');
  });

})