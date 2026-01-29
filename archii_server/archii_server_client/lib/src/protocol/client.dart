/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'package:archii_server_client/src/protocol/chat_message.dart' as _i5;
import 'package:archii_server_client/src/protocol/vision_analysis.dart' as _i6;
import 'package:archii_server_client/src/protocol/design_result.dart' as _i7;
import 'package:archii_server_client/src/protocol/design_request.dart' as _i8;
import 'package:archii_server_client/src/protocol/large_scale_request.dart'
    as _i9;
import 'package:archii_server_client/src/protocol/project.dart' as _i10;
import 'package:archii_server_client/src/protocol/project_status.dart' as _i11;
import 'package:archii_server_client/src/protocol/greetings/greeting.dart'
    as _i12;
import 'protocol.dart' as _i13;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i1.EndpointEmailIdpBase {
  EndpointEmailIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<_i4.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i3.Future<_i2.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i3.Future<String> verifyRegistrationCode({
    required _i2.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i3.Future<_i4.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i3.Future<_i2.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i3.Future<String> verifyPasswordResetCode({
    required _i2.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i4.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i3.Future<_i4.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// Endpoint for real-time chat with AI design assistant
/// {@category Endpoint}
class EndpointChat extends _i2.EndpointRef {
  EndpointChat(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chat';

  /// Save a chat message to the database
  _i3.Future<_i5.ChatMessage> saveMessage(_i5.ChatMessage message) =>
      caller.callServerEndpoint<_i5.ChatMessage>(
        'chat',
        'saveMessage',
        {'message': message},
      );

  /// Get chat history for a project
  _i3.Future<List<_i5.ChatMessage>> getProjectChatHistory(
    int projectId, {
    required int limit,
  }) => caller.callServerEndpoint<List<_i5.ChatMessage>>(
    'chat',
    'getProjectChatHistory',
    {
      'projectId': projectId,
      'limit': limit,
    },
  );

  /// Get chat history for a user (global chat)
  _i3.Future<List<_i5.ChatMessage>> getUserChatHistory(
    int userId, {
    required int limit,
  }) => caller.callServerEndpoint<List<_i5.ChatMessage>>(
    'chat',
    'getUserChatHistory',
    {
      'userId': userId,
      'limit': limit,
    },
  );

  /// Delete chat history for a project
  _i3.Future<int> clearProjectChatHistory(int projectId) =>
      caller.callServerEndpoint<int>(
        'chat',
        'clearProjectChatHistory',
        {'projectId': projectId},
      );
}

/// Endpoint for AI design services - proxies requests to Python AI backend
/// {@category Endpoint}
class EndpointDesign extends _i2.EndpointRef {
  EndpointDesign(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'design';

  /// Analyze a room image using AI vision
  _i3.Future<_i6.VisionAnalysis> analyzeRoom(String imageBase64) =>
      caller.callServerEndpoint<_i6.VisionAnalysis>(
        'design',
        'analyzeRoom',
        {'imageBase64': imageBase64},
      );

  /// Generate a design plan based on requirements
  _i3.Future<_i7.DesignResult> generateDesignPlan(_i8.DesignRequest request) =>
      caller.callServerEndpoint<_i7.DesignResult>(
        'design',
        'generateDesignPlan',
        {'request': request},
      );

  /// Full design pipeline: analyze image + generate design
  _i3.Future<_i7.DesignResult> fullDesignPipeline(_i8.DesignRequest request) =>
      caller.callServerEndpoint<_i7.DesignResult>(
        'design',
        'fullDesignPipeline',
        {'request': request},
      );

  /// Generate visual representation of a design
  _i3.Future<String> generateVisual(_i7.DesignResult designPlan) =>
      caller.callServerEndpoint<String>(
        'design',
        'generateVisual',
        {'designPlan': designPlan},
      );
}

/// Endpoint for large-scale architectural projects (townships, complexes, etc.)
/// {@category Endpoint}
class EndpointLargeScale extends _i2.EndpointRef {
  EndpointLargeScale(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'largeScale';

  /// Generate a master plan for large-scale projects
  _i3.Future<Map<String, dynamic>> generateMasterPlan(
    _i9.LargeScaleRequest request,
  ) => caller.callServerEndpoint<Map<String, dynamic>>(
    'largeScale',
    'generateMasterPlan',
    {'request': request},
  );

  /// Generate construction strategy
  _i3.Future<Map<String, dynamic>> generateConstructionStrategy(
    _i9.LargeScaleRequest request,
  ) => caller.callServerEndpoint<Map<String, dynamic>>(
    'largeScale',
    'generateConstructionStrategy',
    {'request': request},
  );

  /// Get architectural concepts
  _i3.Future<Map<String, dynamic>> getArchitecturalConcepts(
    _i9.LargeScaleRequest request,
  ) => caller.callServerEndpoint<Map<String, dynamic>>(
    'largeScale',
    'getArchitecturalConcepts',
    {'request': request},
  );

  /// Environmental assessment
  _i3.Future<Map<String, dynamic>> getEnvironmentalAssessment(
    _i9.LargeScaleRequest request,
  ) => caller.callServerEndpoint<Map<String, dynamic>>(
    'largeScale',
    'getEnvironmentalAssessment',
    {'request': request},
  );

  /// Complete large-scale planning (combines all above)
  _i3.Future<Map<String, dynamic>> completeLargeScalePlanning(
    _i9.LargeScaleRequest request,
  ) => caller.callServerEndpoint<Map<String, dynamic>>(
    'largeScale',
    'completeLargeScalePlanning',
    {'request': request},
  );
}

/// Endpoint for managing architectural design projects
/// {@category Endpoint}
class EndpointProject extends _i2.EndpointRef {
  EndpointProject(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'project';

  /// Create a new project
  _i3.Future<_i10.Project> createProject(_i10.Project project) =>
      caller.callServerEndpoint<_i10.Project>(
        'project',
        'createProject',
        {'project': project},
      );

  /// Get all projects for a user
  _i3.Future<List<_i10.Project>> getUserProjects(int userId) =>
      caller.callServerEndpoint<List<_i10.Project>>(
        'project',
        'getUserProjects',
        {'userId': userId},
      );

  /// Get a single project by ID
  _i3.Future<_i10.Project?> getProject(int projectId) =>
      caller.callServerEndpoint<_i10.Project?>(
        'project',
        'getProject',
        {'projectId': projectId},
      );

  /// Update a project
  _i3.Future<_i10.Project> updateProject(_i10.Project project) =>
      caller.callServerEndpoint<_i10.Project>(
        'project',
        'updateProject',
        {'project': project},
      );

  /// Delete a project
  _i3.Future<bool> deleteProject(int projectId) =>
      caller.callServerEndpoint<bool>(
        'project',
        'deleteProject',
        {'projectId': projectId},
      );

  /// Update project status
  _i3.Future<_i10.Project?> updateProjectStatus(
    int projectId,
    _i11.ProjectStatus status,
  ) => caller.callServerEndpoint<_i10.Project?>(
    'project',
    'updateProjectStatus',
    {
      'projectId': projectId,
      'status': status,
    },
  );

  /// Get projects by status
  _i3.Future<List<_i10.Project>> getProjectsByStatus(
    int userId,
    _i11.ProjectStatus status,
  ) => caller.callServerEndpoint<List<_i10.Project>>(
    'project',
    'getProjectsByStatus',
    {
      'userId': userId,
      'status': status,
    },
  );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i2.EndpointRef {
  EndpointGreeting(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i3.Future<_i12.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i12.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i1.Caller(client);
    serverpod_auth_core = _i4.Caller(client);
  }

  late final _i1.Caller serverpod_auth_idp;

  late final _i4.Caller serverpod_auth_core;
}

class Client extends _i2.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i2.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i2.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i13.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    chat = EndpointChat(this);
    design = EndpointDesign(this);
    largeScale = EndpointLargeScale(this);
    project = EndpointProject(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointChat chat;

  late final EndpointDesign design;

  late final EndpointLargeScale largeScale;

  late final EndpointProject project;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i2.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'chat': chat,
    'design': design,
    'largeScale': largeScale,
    'project': project,
    'greeting': greeting,
  };

  @override
  Map<String, _i2.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
