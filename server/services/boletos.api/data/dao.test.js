const { ejecutarQuery } = require('./dao');

describe('ejecutarQuery', () => {
  it('should execute the query and return true if rows are affected', async () => {
    // Arrange
    const query = 'INSERT INTO table_name (column1, column2) VALUES (value1, value2)';

    // Act
    const result = await ejecutarQuery(query);

    // Assert
    expect(result).toBe(true);
  });

  it('should log the error if an exception occurs', async () => {
    // Arrange
    const query = 'INVALID QUERY';

    // Act
    const consoleSpy = jest.spyOn(console, 'log');
    await ejecutarQuery(query);

    // Assert
    expect(consoleSpy).toHaveBeenCalled();
  });
});