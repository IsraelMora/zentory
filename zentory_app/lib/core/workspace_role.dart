enum WorkspaceRole {
  admin('Administrador'),
  editor('Editor'),
  member('Miembro'),
  reader('Lector');

  final String displayName;

  const WorkspaceRole(this.displayName);

  static WorkspaceRole fromString(String value) {
    return WorkspaceRole.values.firstWhere(
      (role) => role.displayName == value,
      orElse: () => WorkspaceRole.member,
    );
  }
}
