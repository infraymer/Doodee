class ParentChild {
  final String id;
  final String child;
  final String parent;

  ParentChild({this.id, this.child, this.parent});

  factory ParentChild.fromMap(Map<String, dynamic> map) {
    return new ParentChild(
      id: map['id'] as String,
      child: map['child'] as String,
      parent: map['parent'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'child': this.child,
      'parent': this.parent,
    } as Map<String, dynamic>;
  }

  ParentChild copyWith({
    String id,
    String child,
    String parent,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (child == null || identical(child, this.child)) &&
        (parent == null || identical(parent, this.parent))) {
      return this;
    }

    return new ParentChild(
      id: id ?? this.id,
      child: child ?? this.child,
      parent: parent ?? this.parent,
    );
  }
}