module.exports = (sequelize, DataTypes) => {
    const Advice = sequelize.define(
      'Advice',
      {
        adviceId: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true
        },
        ticketId: DataTypes.INTEGER,
        description: DataTypes.STRING,
        dateStart: DataTypes.DATE,
        dateFinish: DataTypes.DATE
      }
    );
    return Advice;
  };