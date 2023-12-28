export class UserNotFoundError extends Error {
  code = "USER_NOT_FOUND";
  status = 404;
  constructor() {
    super("User not found!");
  }
}

export class UserPasswordNotMatched extends Error {
  code = "USER_PASSWORD_NOT_MATCHED";
  status = 401;
  constructor() {
    super("User password not matched!");
  }
}
