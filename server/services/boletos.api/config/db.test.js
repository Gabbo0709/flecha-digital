const dbConfig = require('/c:/Users/egusg/OneDrive/Documentos/GitHub/flecha-digital/server/services/boletos.api/config/db.js');

describe('Database Configuration', () => {
  it('should have the correct SQL configuration', () => {
    expect(dbConfig.user).toBe('sa');
    expect(dbConfig.password).toBe('password');
    expect(dbConfig.database).toBe('test');
    expect(dbConfig.server).toBe('localhost');
    expect(dbConfig.pool.max).toBe(10);
    expect(dbConfig.pool.min).toBe(0);
    expect(dbConfig.pool.idleTimeoutMillis).toBe(30000);
    expect(dbConfig.options.encrypt).toBe(false);
    expect(dbConfig.options.trustedConnection).toBe(true);
  });
});