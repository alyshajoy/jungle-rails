describe('product-details', () => {

  it('loads the home page and navigates to the product details page with product is clicked', () => {
    cy.visit("/");
    cy.get('img[alt="Scented Blade"]')
      .click();
    
      cy.url().should('include', '/products');
      cy.get('.product-detail').should('be.visible');
  });

})