abstract class RegisterState{}

class InitailRegisterState extends RegisterState{}

class CreateAccountSuccess extends RegisterState{}

class CreateAccountError extends RegisterState{}

class LoadingCreateAccount extends RegisterState{}

class CreateAccountFireStoreSuccess extends RegisterState{}

class CreateAccountFireStoreError extends RegisterState{}