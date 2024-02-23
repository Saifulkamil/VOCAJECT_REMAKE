class ProjectData {
  final int id;
  final String note;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Project project;
  final Lecture lecture;
  final List<Member> members;
  final List<Attachment> attachments;

  ProjectData({
    required this.id,
    required this.note,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.project,
    required this.lecture,
    required this.members,
    required this.attachments,
  });

  factory ProjectData.fromJson(Map<String, dynamic> json) {
    return ProjectData(
      id: json['id'],
      note: json['note'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      project: Project.fromJson(json['project']),
      lecture: Lecture.fromJson(json['lecture']),
      members: List<Member>.from(json['members'].map((x) => Member.fromJson(x))),
      attachments: List<Attachment>.from(json['attachments'].map((x) => Attachment.fromJson(x))),
    );
  }
}

class Project {
  final int id;
  final String title;
  final String description;
  final int budget;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiredAt;
  final DateTime deadlineAt;
  final Company company;
  final Category category;
  final String status;
  final ManagedBudget managedBudget;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.budget,
    required this.createdAt,
    required this.updatedAt,
    required this.expiredAt,
    required this.deadlineAt,
    required this.company,
    required this.category,
    required this.status,
    required this.managedBudget,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      budget: json['budget'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      expiredAt: DateTime.parse(json['expired_at']),
      deadlineAt: DateTime.parse(json['deadline_at']),
      company: Company.fromJson(json['company']),
      category: Category.fromJson(json['category']),
      status: json['status'],
      managedBudget: ManagedBudget.fromJson(json['managed_budget']),
    );
  }
}

class Company {
  final int id;
  final String name;
  final String email;
  final String picture;
  final String description;
  final int balance;
  final String address;
  final String phone;
  final String role;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Company({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.description,
    required this.balance,
    required this.address,
    required this.phone,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      picture: json['picture'],
      description: json['description'],
      balance: json['balance'],
      address: json['address'],
      phone: json['phone'],
      role: json['role'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Category {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      slug: json['slug'],
    );
  }
}

class ManagedBudget {
  final int id;
  final int projectId;
  final int student;
  final int lecture;
  final int college;
  final int remaining;
  final DateTime createdAt;
  final DateTime updatedAt;

  ManagedBudget({
    required this.id,
    required this.projectId,
    required this.student,
    required this.lecture,
    required this.college,
    required this.remaining,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ManagedBudget.fromJson(Map<String, dynamic> json) {
    return ManagedBudget(
      id: json['id'],
      projectId: json['project_id'],
      student: json['student'],
      lecture: json['lecture'],
      college: json['college'],
      remaining: json['remaining'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Lecture {
  final int id;
  final String name;
  final String email;
  final String picture;
  final String nidn;
  final int balance;
  final String address;
  final String phone;
  final String role;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Company college;

  Lecture({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.nidn,
    required this.balance,
    required this.address,
    required this.phone,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.college,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      picture: json['picture'],
      nidn: json['nidn'],
      balance: json['balance'],
      address: json['address'],
      phone: json['phone'],
      role: json['role'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      college: Company.fromJson(json['college']),
    );
  }
}

class Member {
  final int id;
  final String name;
  final String email;
  final String picture;
  final String nim;
  final int balance;
  final String address;
  final String phone;
  final String role;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Company college;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.nim,
    required this.balance,
    required this.address,
    required this.phone,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.college,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      picture: json['picture'],
      nim: json['nim'],
      balance: json['balance'],
      address: json['address'],
      phone: json['phone'],
      role: json['role'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      college: Company.fromJson(json['college']),
    );
  }
}

class Attachment {
  final int id;
  final int proposalId;
  final String filepath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String filename;
  final String mimetype;

  Attachment({
    required this.id,
    required this.proposalId,
    required this.filepath,
    required this.createdAt,
    required this.updatedAt,
    required this.filename,
    required this.mimetype,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      proposalId: json['proposal_id'],
      filepath: json['filepath'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      filename: json['filename'],
      mimetype: json['mimetype'],
    );
  }
}
