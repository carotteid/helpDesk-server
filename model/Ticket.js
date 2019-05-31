module.exports = (sequelize, DataTypes) => {
    const Ticket = sequelize.define(
      'Ticket',
      {
        ticketId: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true
        },
        title: DataTypes.STRING,
        description: DataTypes.STRING,
        evidence: DataTypes.STRING,
        status: DataTypes.INTEGER
      }
    );
    Ticket.associate = models => {
      models.Ticket.hasMany(models.Monitor);
      models.Ticket.belongsTo(models.Department);
      models.Ticket.belongsTo(models.Category);
      models.Ticket.belongsTo(models.User);
      models.Ticket.belongsTo(models.User, {as: 'Manager'});
    };
    return Ticket;
  };