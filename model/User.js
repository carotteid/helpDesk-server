module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define(
      'User',
      {
        userId: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true
        },
        name: DataTypes.STRING,
        lastName: DataTypes.STRING,
        email: {type: DataTypes.STRING, unique: true},
        phone: DataTypes.STRING,
        userName: {type: DataTypes.STRING, unique: true},
        password: DataTypes.STRING,
        admin: DataTypes.STRING
      }
    );
    User.associate = models => {
      models.User.hasMany(models.Ticket);
      models.User.hasMany(models.Ticket, {as : 'Manager'});
      models.User.belongsTo(models.Company);
      models.User.belongsTo(models.Department);
    };
    return User;
  };