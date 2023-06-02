describe('Login', () => {
  beforeEach(() => {
    cy.on('uncaught:exception', () => {
      // No hacer nada en caso de que ocurra una excepción no capturada
      return false;
    });
  });

  it('should log in successfully', () => {
    cy.visit('http://127.0.0.1:3000/order_foods');

    cy.get('#email_field').type('admin@example.com');
    cy.get('#password_field').type('password');

    cy.get('#login').click();

    cy.url().should('include', '/order_foods');
  });
});
