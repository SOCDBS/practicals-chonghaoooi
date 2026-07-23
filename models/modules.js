const { PrismaClient, Prisma } = require('@prisma/client');
const { EMPTY_RESULT_ERROR, UNIQUE_VIOLATION_ERROR } = require('../errors');

const prisma = new PrismaClient();

async function createSampleUser() {
  try {
    const user = await prisma.user.create({
      data: {
        email: 'elsa@prisma.io',
        name: 'Elsa Prisma',
      },
    });

    console.log(user);
  } catch (error) {
    if (
      error instanceof Prisma.PrismaClientKnownRequestError &&
      error.code === 'P2002'
    ) {
      console.log(
        'There is a unique constraint violation, a new user cannot be created with this email'
      );
    } else {
      throw error;
    }
  }
}

module.exports.create = function create(code, name, credit) {
  return prisma.module
    .create({
      data: {
        modCode: code,
        modName: name,
        creditUnit: Number(credit),
      },
    })
    .then(function (moduleRecord) {
      return moduleRecord;
    })
    .catch(function (error) {
      if (
        error instanceof Prisma.PrismaClientKnownRequestError &&
        error.code === 'P2002'
      ) {
        throw new UNIQUE_VIOLATION_ERROR(`Module ${code} already exists`);
      }
      throw error;
    });
};

module.exports.retrieveByCode = function retrieveByCode(code) {
  return prisma.module
    .findUnique({
      where: {
        modCode: code,
      },
    })
    .then(function (moduleRecord) {
      if (!moduleRecord) {
        throw new EMPTY_RESULT_ERROR(`Module ${code} not found!`);
      }

      return moduleRecord;
    })
    .catch(function (error) {
      if (error instanceof EMPTY_RESULT_ERROR) {
        throw error;
      }
      throw error;
    });
};

module.exports.deleteByCode = function deleteByCode(code) {
  return prisma.module
    .delete({
      where: {
        modCode: code,
      },
    })
    .then(function (moduleRecord) {
      return moduleRecord;
    })
    .catch(function (error) {
      if (
        error instanceof Prisma.PrismaClientKnownRequestError &&
        error.code === 'P2025'
      ) {
        throw new EMPTY_RESULT_ERROR(`Module ${code} not found!`);
      }
      throw error;
    });
};

module.exports.updateByCode = function updateByCode(code, credit) {
  return prisma.module
    .update({
      where: {
        modCode: code,
      },
      data: {
        creditUnit: Number(credit),
      },
    })
    .then(function (moduleRecord) {
      return moduleRecord;
    })
    .catch(function (error) {
      if (
        error instanceof Prisma.PrismaClientKnownRequestError &&
        error.code === 'P2025'
      ) {
        throw new EMPTY_RESULT_ERROR(`Module ${code} not found!`);
      }
      throw error;
    });
};

module.exports.retrieveAll = function retrieveAll() {
  return prisma.module.findMany().then(function (moduleRecords) {
    return moduleRecords;
  });
};

module.exports.createSampleUser = createSampleUser;