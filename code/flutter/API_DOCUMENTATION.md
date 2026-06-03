# LMS Backend — API Documentation

**Base URL:** `/api/v1`

---

## Table of Contents

1. [Authentication](#1-authentication)
2. [Courses](#2-courses)
3. [Course Sections](#3-course-sections)
4. [Lessons](#4-lessons)
5. [Groups](#5-groups)
6. [Lesson Sessions](#6-lesson-sessions)
7. [Schedules](#7-schedules)
8. [Attendances](#8-attendances)
9. [Attendance Notes](#9-attendance-notes)
10. [Users](#10-users)
11. [Student Profiles](#11-student-profiles)
12. [Parent Profiles](#12-parent-profiles)
13. [Teacher Profiles](#13-teacher-profiles)
14. [Attachments](#14-attachments)
15. [TUS Resumable Upload](#15-tus-resumable-upload)
16. [Data Types & Enums](#16-data-types--enums)
17. [Generic Response Wrappers](#17-generic-response-wrappers)

---

## 1. Authentication

**Prefix:** `/api/v1/auth`

### POST `/api/v1/auth/login`
Login with username and password.

- **Auth required:** No (`@OpenAuth`)
- **Content-Type:** `application/json`

**Request Body:** `LoginRequest`
```json
{
  "username": "string (NotNull)",
  "password": "string (NotNull)"
}
```

**Response:** `ApiResponse<JwtResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "accessToken": "string"
  }
}
```

---

### POST `/api/v1/auth/logout`
Logout the current user.

- **Auth required:** No (`@OpenAuth`)
- **Request Body:** None

**Response:** `ApiResponse<Void>`

---

### GET `/api/v1/auth/me`
Get current authenticated user info.

- **Auth required:** Yes

**Response:** `ApiResponse<AuthMe>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "firstName": "string",
    "lastName": "string",
    "middleName": "string",
    "email": "string",
    "phoneNumber": "string",
    "gender": "MALE | FEMALE",
    "status": "ACTIVE | INACTIVE | BLOCKED",
    "birthDate": "string",
    "profileImageAttachmentId": "UUID",
    "profileImageUrl": "string",
    "profileBackgroundAttachmentId": "UUID",
    "profileBackgroundUrl": "string",
    "roles": ["Role"]
  }
}
```

---

### PATCH `/api/v1/auth/me`
Update current user's profile. Supports two variants:

#### Variant A — JSON only
- **Content-Type:** `application/json`

**Request Body:** `AuthMeRequest`
```json
{
  "firstName":   "string (max 100)",
  "lastName":    "string (max 100)",
  "middleName":  "string (max 100)",
  "gender":      "MALE | FEMALE",
  "phoneNumber": "string (max 30)",
  "brithDate":   "datetime",
  "email":       "string (valid email, max 255)"
}
```

#### Variant B — Multipart form (with images)
- **Content-Type:** `multipart/form-data`

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `request` | JSON part (`AuthMeRequest`) | No | Same fields as Variant A |
| `profileImage` | `MultipartFile` | No | Profile avatar image |
| `profileBackgroundImage` | `MultipartFile` | No | Profile background image |

**Response (both variants):** `ApiResponse<AuthMe>`

---

## 2. Courses

**Prefix:** `/api/v1/courses`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/courses`
List courses with optional filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `search` | string | — | Search by title |
| `level` | `CourseLevel` | — | Filter by level |
| `minDuration` | int | — | Min duration in minutes |
| `maxDuration` | int | — | Max duration in minutes |

**Response:** `ApiPaginateResponse<List<CourseResponse>>`

---

### GET `/api/v1/courses/{id}`
Get a single course by ID (includes sections).

**Path Variable:** `id` — UUID

**Response:** `ApiResponse<CourseResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "title": "string",
    "description": "string",
    "level": "BEGINNER | INTERMEDIATE | ADVANCED",
    "durationInMinutes": 0,
    "sections": ["CourseSectionResponse"]
  }
}
```

---

### POST `/api/v1/courses`
Create a new course.

- **Content-Type:** `application/json`

**Request Body:** `CourseCreateRequest`
```json
{
  "title":             "string (NotBlank, max 255)",
  "description":       "string (max 3000, optional)",
  "level":             "BEGINNER | INTERMEDIATE | ADVANCED (NotNull)",
  "durationInMinutes": "int (Positive, NotNull)"
}
```

**Response:** `ApiResponse<CourseResponse>`

---

### PUT `/api/v1/courses/{id}`
Update an existing course.

**Path Variable:** `id` — UUID
**Request Body:** `CourseUpdateRequest` — same fields as `CourseCreateRequest`, all required.

**Response:** `ApiResponse<CourseResponse>`

---

### DELETE `/api/v1/courses/{id}`
Soft-delete a course.

**Path Variable:** `id` — UUID
**Response:** `ApiResponse<Void>`

---

## 3. Course Sections

**Prefix:** `/api/v1/course-sections`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/course-sections`
List course sections with filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `search` | string | — | Search by title |
| `courseId` | UUID | — | Filter by course |
| `orderIndex` | int | — | Filter by order index |

**Response:** `ApiPaginateResponse<List<CourseSectionResponse>>`

---

### GET `/api/v1/course-sections/{id}`
Get a single section by ID (includes lessons).

**Response:** `ApiResponse<CourseSectionResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "title": "string",
    "orderIndex": 0,
    "courseId": "UUID",
    "lessons": ["LessonResponse"]
  }
}
```

---

### POST `/api/v1/course-sections`
Create a new section.

**Request Body:** `CourseSectionCreateRequest`
```json
{
  "title":      "string (NotBlank, max 255)",
  "courseId":   "UUID (NotNull)",
  "orderIndex": "int (PositiveOrZero, NotNull)"
}
```

**Response:** `ApiResponse<CourseSectionResponse>`

---

### PUT `/api/v1/course-sections/{id}`
Update an existing section.

**Request Body:** `CourseSectionUpdateRequest`
```json
{
  "title":      "string (NotBlank, max 255)",
  "orderIndex": "int (PositiveOrZero, NotNull)"
}
```

**Response:** `ApiResponse<CourseSectionResponse>`

---

### DELETE `/api/v1/course-sections/{id}`
Soft-delete a section.

**Response:** `ApiResponse<Void>`

---

## 4. Lessons

**Prefix:** `/api/v1/lessons`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/lessons`
List lessons with filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `search` | string | — | Search by title |
| `sectionId` | UUID | — | Filter by section |
| `minDuration` | int | — | Min duration in minutes |
| `maxDuration` | int | — | Max duration in minutes |

**Response:** `ApiPaginateResponse<List<LessonResponse>>`

---

### GET `/api/v1/lessons/{id}`
Get a single lesson by ID.

**Response:** `ApiResponse<LessonResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "title": "string",
    "content": "string",
    "durationInMinutes": 0,
    "sectionId": "UUID"
  }
}
```

---

### POST `/api/v1/lessons`
Create a new lesson.

**Request Body:** `LessonCreateRequest`
```json
{
  "title":             "string (NotBlank, max 255)",
  "content":           "string (max 20000, optional)",
  "durationInMinutes": "int (Positive, NotNull)",
  "sectionId":         "UUID (NotNull)"
}
```

**Response:** `ApiResponse<LessonResponse>`

---

### PUT `/api/v1/lessons/{id}`
Update an existing lesson.

**Request Body:** `LessonUpdateRequest`
```json
{
  "title":             "string (NotBlank, max 255)",
  "content":           "string (max 20000, optional)",
  "durationInMinutes": "int (Positive, NotNull)"
}
```

**Response:** `ApiResponse<LessonResponse>`

---

### DELETE `/api/v1/lessons/{id}`
Soft-delete a lesson.

**Response:** `ApiResponse<Void>`

---

## 5. Groups

**Prefix:** `/api/v1/groups`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/groups`
List groups with filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `search` | string | — | Search by name |
| `courseId` | UUID | — | Filter by course |
| `teacherId` | UUID | — | Filter by teacher |
| `status` | `GroupStatus` | — | Filter by status |
| `active` | boolean | — | Filter by active flag |
| `minCapacity` | int | — | Min capacity |
| `maxCapacity` | int | — | Max capacity |

**Response:** `ApiPaginateResponse<List<GroupResponse>>`

---

### GET `/api/v1/groups/{id}`
Get a single group by ID.

**Response:** `ApiResponse<GroupResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "name": "string",
    "courseId": "UUID",
    "courseName": "string",
    "teacher": {
      "userId": "UUID",
      "teacherId": "UUID",
      "firstName": "string",
      "lastName": "string",
      "middleName": "string",
      "email": "string",
      "phoneNumber": "string",
      "gender": "MALE | FEMALE",
      "status": "ACTIVE | INACTIVE | BLOCKED",
      "birthDate": "string",
      "profileImageUrl": "string",
      "profileBackgroundUrl": "string"
    },
    "capacity": 0,
    "scheduleType": "EXACT_DAYS | ODD_DAYS | EVEN_DAYS",
    "scheduleDays": ["DayOfWeek"],
    "active": true,
    "currentStudents": 0,
    "status": "FORMING | ACTIVE | FINISHED | CANCELLED"
  }
}
```

---

### POST `/api/v1/groups`
Create a new group.

**Request Body:** `GroupCreateRequest`
```json
{
  "name":         "string (NotBlank)",
  "courseId":     "UUID (NotNull)",
  "teacherId":    "UUID (NotNull)",
  "capacity":     "int (Min 1)",
  "scheduleType": "EXACT_DAYS | ODD_DAYS | EVEN_DAYS (NotNull)",
  "scheduleDays": ["DayOfWeek"],
  "active":       "boolean (default true, optional)"
}
```

**Response:** `ApiResponse<GroupResponse>`

---

### PUT `/api/v1/groups/{id}`
Update an existing group.

**Request Body:** `GroupUpdateRequest`
```json
{
  "name":         "string (NotBlank)",
  "courseId":     "UUID (NotNull)",
  "teacherId":    "UUID (NotNull)",
  "capacity":     "int (Min 1)",
  "scheduleType": "EXACT_DAYS | ODD_DAYS | EVEN_DAYS (NotNull)",
  "scheduleDays": ["DayOfWeek"],
  "active":       "boolean (NotNull)",
  "status":       "FORMING | ACTIVE | FINISHED | CANCELLED (NotNull)"
}
```

**Response:** `ApiResponse<GroupResponse>`

---

### POST `/api/v1/groups/{id}/start`
Start a group by assigning its weekly schedules. Transitions the group to active/started state.

**Path Variable:** `id` — UUID

**Request Body:** `GroupStartRequest`
```json
{
  "schedules": [
    {
      "dayOfWeek": "DayOfWeek (NotNull)",
      "startTime": "LocalTime (NotNull)",
      "endTime":   "LocalTime (NotNull)"
    }
  ]
}
```

**Response:** `ApiResponse<GroupStartResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "group": "GroupResponse",
    "schedules": ["ScheduleResponse"]
  }
}
```

---

### POST `/api/v1/groups/{id}/lesson-sessions/generate`
Generate lesson sessions for the group based on its schedules and a date range.

**Path Variable:** `id` — UUID

**Request Body:** `LessonSessionGenerateRequest`
```json
{
  "fromDate": "date (NotNull)",
  "toDate":   "date (NotNull)"
}
```

**Response:** `ApiResponse<List<LessonSessionResponse>>`

---

### DELETE `/api/v1/groups/{id}`
Soft-delete a group.

**Response:** `ApiResponse<Void>`

---

## 6. Lesson Sessions

**Prefix:** `/api/v1/lesson-sessions`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/lesson-sessions`
List lesson sessions with filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `groupId` | UUID | — | Filter by group |
| `lessonId` | UUID | — | Filter by lesson |
| `status` | `LessonSessionStatus` | — | Filter by status |
| `from` | datetime | — | Filter by start time (from) |
| `to` | datetime | — | Filter by start time (to) |

**Response:** `ApiPaginateResponse<List<LessonSessionResponse>>`

---

### GET `/api/v1/lesson-sessions/{id}`
Get a single lesson session by ID.

**Response:** `ApiResponse<LessonSessionResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "groupId": "UUID",
    "groupName": "string",
    "lessonId": "UUID",
    "lessonTitle": "string",
    "startTime": "datetime",
    "endTime": "datetime",
    "status": "PLANNED | DONE | CANCELLED"
  }
}
```

---

### POST `/api/v1/lesson-sessions`
Create a new lesson session.

**Request Body:** `LessonSessionCreateRequest`
```json
{
  "groupId":   "UUID (NotNull)",
  "lessonId":  "UUID (NotNull)",
  "startTime": "datetime (NotNull)",
  "endTime":   "datetime (NotNull)",
  "status":    "PLANNED | DONE | CANCELLED (default PLANNED)"
}
```

**Response:** `ApiResponse<LessonSessionResponse>`

---

### PUT `/api/v1/lesson-sessions/{id}`
Update an existing lesson session.

**Request Body:** `LessonSessionUpdateRequest`
```json
{
  "groupId":   "UUID (NotNull)",
  "lessonId":  "UUID (NotNull)",
  "startTime": "datetime (NotNull)",
  "endTime":   "datetime (NotNull)",
  "status":    "PLANNED | DONE | CANCELLED (NotNull)"
}
```

**Response:** `ApiResponse<LessonSessionResponse>`

---

### DELETE `/api/v1/lesson-sessions/{id}`
Soft-delete a lesson session.

**Response:** `ApiResponse<Void>`

---

## 7. Schedules

**Prefix:** `/api/v1/schedules`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/schedules`
List schedules with filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `groupId` | UUID | — | Filter by group |
| `dayOfWeek` | `DayOfWeek` | — | Filter by day of week |

**Response:** `ApiPaginateResponse<List<ScheduleResponse>>`

---

### GET `/api/v1/schedules/{id}`
Get a single schedule by ID.

**Response:** `ApiResponse<ScheduleResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "groupId": "UUID",
    "groupName": "string",
    "dayOfWeek": "DayOfWeek",
    "startTime": "time",
    "endTime": "time"
  }
}
```

---

### POST `/api/v1/schedules`
Create a new schedule entry.

**Request Body:** `ScheduleCreateRequest`
```json
{
  "groupId":   "UUID (NotNull)",
  "dayOfWeek": "DayOfWeek (NotNull)",
  "startTime": "time (NotNull)",
  "endTime":   "time (NotNull)"
}
```

**Response:** `ApiResponse<ScheduleResponse>`

---

### PUT `/api/v1/schedules/{id}`
Update an existing schedule entry.

**Request Body:** `ScheduleUpdateRequest`
```json
{
  "groupId":   "UUID (NotNull)",
  "dayOfWeek": "DayOfWeek (NotNull)",
  "startTime": "time (NotNull)",
  "endTime":   "time (NotNull)"
}
```

**Response:** `ApiResponse<ScheduleResponse>`

---

### DELETE `/api/v1/schedules/{id}`
Soft-delete a schedule entry.

**Response:** `ApiResponse<Void>`

---

## 8. Attendances

**Prefix:** `/api/v1/attendances`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/attendances`
List attendance records with filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `studentId` | UUID | — | Filter by student user ID |
| `lessonSessionId` | UUID | — | Filter by lesson session |
| `groupId` | UUID | — | Filter by group |
| `lessonId` | UUID | — | Filter by lesson |
| `status` | `AttendanceStatus` | — | Filter by attendance status |
| `from` | datetime | — | Filter by lesson start time (from) |
| `to` | datetime | — | Filter by lesson start time (to) |

**Response:** `ApiPaginateResponse<List<AttendanceResponse>>`

---

### GET `/api/v1/attendances/{id}`
Get a single attendance record by ID.

**Response:** `ApiResponse<AttendanceResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "studentId": "UUID",
    "studentProfileId": "UUID",
    "studentFullName": "string",
    "lessonSessionId": "UUID",
    "groupId": "UUID",
    "groupName": "string",
    "lessonId": "UUID",
    "lessonTitle": "string",
    "lessonStartTime": "datetime",
    "lessonEndTime": "datetime",
    "status": "PRESENT | ABSENT | LATE | EXCUSED"
  }
}
```

---

### POST `/api/v1/attendances`
Create a new attendance record.

**Request Body:** `AttendanceCreateRequest`
```json
{
  "studentId":       "UUID (NotNull)",
  "lessonSessionId": "UUID (NotNull)",
  "status":          "PRESENT | ABSENT | LATE | EXCUSED (NotNull)"
}
```

**Response:** `ApiResponse<AttendanceResponse>`

---

### PUT `/api/v1/attendances/{id}`
Update an existing attendance record.

**Request Body:** `AttendanceUpdateRequest`
```json
{
  "studentId":       "UUID (NotNull)",
  "lessonSessionId": "UUID (NotNull)",
  "status":          "PRESENT | ABSENT | LATE | EXCUSED (NotNull)"
}
```

**Response:** `ApiResponse<AttendanceResponse>`

---

### DELETE `/api/v1/attendances/{id}`
Soft-delete an attendance record.

**Response:** `ApiResponse<Void>`

---

## 9. Attendance Notes

**Prefix:** `/api/v1/attendance-notes`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/attendance-notes`
List attendance notes with filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `attendanceId` | UUID | — | Filter by attendance record |
| `studentId` | UUID | — | Filter by student user ID |
| `lessonSessionId` | UUID | — | Filter by lesson session |
| `groupId` | UUID | — | Filter by group |
| `lessonId` | UUID | — | Filter by lesson |

**Response:** `ApiPaginateResponse<List<AttendanceNoteResponse>>`

---

### GET `/api/v1/attendance-notes/{id}`
Get a single attendance note by ID.

**Response:** `ApiResponse<AttendanceNoteResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "attendanceId": "UUID",
    "studentProfileId": "UUID",
    "studentFullName": "string",
    "lessonSessionId": "UUID",
    "groupId": "UUID",
    "groupName": "string",
    "lessonId": "UUID",
    "lessonTitle": "string",
    "note": "string"
  }
}
```

---

### POST `/api/v1/attendance-notes`
Create a new attendance note.

**Request Body:** `AttendanceNoteCreateRequest`
```json
{
  "attendanceId": "UUID (NotNull)",
  "note":         "string (NotBlank, max 1000)"
}
```

**Response:** `ApiResponse<AttendanceNoteResponse>`

---

### PUT `/api/v1/attendance-notes/{id}`
Update an existing attendance note.

**Request Body:** `AttendanceNoteUpdateRequest`
```json
{
  "attendanceId": "UUID (NotNull)",
  "note":         "string (NotBlank, max 1000)"
}
```

**Response:** `ApiResponse<AttendanceNoteResponse>`

---

### DELETE `/api/v1/attendance-notes/{id}`
Soft-delete an attendance note.

**Response:** `ApiResponse<Void>`

---

## 10. Users

**Prefix:** `/api/v1/user`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/user`
List all users. **Role required: `SUPER_ADMIN`**

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `search` | string | — | Search by name/email |
| `role` | `SystemRole` | — | Filter by role |
| `status` | `UserStatus` | — | Filter by status |
| `permission` | UUID | — | Filter by permission ID |

**Response:** `ApiPaginateResponse<List<UserPreview>>`
```json
{
  "results": [
    {
      "id": "UUID",
      "firstName": "string",
      "lastName": "string",
      "middleName": "string",
      "email": "string",
      "phoneNumber": "string",
      "status": "ACTIVE | INACTIVE | BLOCKED",
      "profileImageUrl": "string",
      "profileBackgroundUrl": "string",
      "roles": ["string"]
    }
  ]
}
```

---

### POST `/api/v1/user`
Create a new user.

- **Content-Type:** `multipart/form-data`

Fields are submitted as individual form fields (bound via `@ModelAttribute`):

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `firstName` | string | Yes | Max 100 chars |
| `lastName` | string | Yes | Max 100 chars |
| `middleName` | string | No | Max 100 chars |
| `gender` | `Gender` | Yes | `MALE` or `FEMALE` |
| `birthDate` | datetime | No | |
| `phoneNumber` | string | Yes | 7–30 chars, regex: `^[+0-9()\-\s]{7,30}$` |
| `email` | string | Yes | Valid email, max 255 chars |
| `password` | string | Yes | 8–255 chars |
| `status` | `UserStatus` | Yes | Default `ACTIVE` |
| `roles[0].id` | UUID | Yes | Role ID |
| `roles[0].permissions[0]` | UUID | No | Permission ID |
| `profileImage` | `MultipartFile` | No | Profile image |
| `profileBackgroundAttachment` | `MultipartFile` | No | Background image |

**Response:** `ApiResponse<AuthMe>`

---

## 11. Student Profiles

**Prefix:** `/api/v1/student`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/student`
List student profiles with filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `search` | string | — | Search by name |
| `status` | `StudentStatus` | — | Filter by student status |

**Response:** `ApiPaginateResponse<List<StudentProfileResponse>>`
```json
{
  "results": [
    {
      "baseData": { "...AuthMe fields..." },
      "studentId": "UUID",
      "status": "ACTIVE | SUSPENDED | GRADUATED"
    }
  ]
}
```

---

### POST `/api/v1/student`
Create a student profile for an existing user.

**Request Body:** `StudentProfileRequest`
```json
{
  "userId":    "UUID",
  "studentId": "UUID",
  "status":    "ACTIVE | SUSPENDED | GRADUATED (optional)"
}
```

**Response:** `ApiResponse<StudentProfileResponse>`

---

## 12. Parent Profiles

**Prefix:** `/api/v1/parent`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/parent`
List parent profiles with pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `search` | string | — | Search by name |

**Response:** `ApiPaginateResponse<List<ParentProfileResponse>>`
```json
{
  "results": [
    {
      "baseData": { "...AuthMe fields..." },
      "studentsCount": 0
    }
  ]
}
```

---

### POST `/api/v1/parent`
Create a parent profile for an existing user.

**Request Body:** `ParentProfileRequest`
```json
{
  "userId":     "UUID",
  "studentIds": ["UUID"]
}
```

**Response:** `ApiResponse<ParentProfileResponse>`

---

## 13. Teacher Profiles

**Prefix:** `/api/v1/teacher`
**Auth required:** Yes (all endpoints)

### GET `/api/v1/teacher`
List teacher profiles with filtering and pagination.

**Query Parameters:**

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `size` | int | 10 | Page size |
| `search` | string | — | Search by name |
| `position` | `TeacherPosition` | — | Filter by position |

**Response:** `ApiPaginateResponse<List<TeacherProfileResponse>>`
```json
{
  "results": [
    {
      "teacherId": "UUID",
      "user": { "...AuthMe fields..." },
      "position": "PROFESSOR | LECTURER | ASSISTANT"
    }
  ]
}
```

---

### POST `/api/v1/teacher`
Create a teacher profile for an existing user.

**Request Body:** `TeacherProfileRequest`
```json
{
  "userId":   "UUID",
  "position": "PROFESSOR | LECTURER | ASSISTANT (optional)"
}
```

**Response:** `ApiResponse<TeacherProfileResponse>`

---

## 14. Attachments

**Prefix:** `/api/v1/attachments`
**Auth required:** Yes (all endpoints)
**Content-Type:** `multipart/form-data`

### POST `/api/v1/attachments`
Upload a single file.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `file` | `MultipartFile` | Yes | File to upload |
| `type` | `AttachmentType` (query param) | No | Attachment category |

**Response:** `ApiResponse<AttachmentResponse>`
```json
{
  "success": true,
  "message": "string",
  "data": {
    "id": "UUID",
    "originalName": "string",
    "storedName": "string",
    "path": "string",
    "url": "string",
    "size": 0,
    "contentType": "string",
    "extension": "string",
    "checksum": "string",
    "type": "IMAGE | VIDEO | AUDIO | DOCUMENT | FILE | OTHER",
    "uploadedById": "UUID",
    "createdAt": "datetime"
  }
}
```

---

### POST `/api/v1/attachments/bulk`
Upload multiple files at once.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `files` | `List<MultipartFile>` | Yes | Files to upload |
| `type` | `AttachmentType` (query param) | No | Attachment category |

**Response:** `ApiResponse<List<AttachmentResponse>>`

---

### DELETE `/api/v1/attachments/{id}`
Delete an attachment by ID.

**Path Variable:** `id` — UUID
**Response:** `ApiResponse<Void>`

---

## 15. TUS Resumable Upload

**Prefix:** `/files`
**Auth required:** No (`@OpenAuth`)
**Protocol:** [TUS 1.0.0](https://tus.io/protocols/resumable-upload)

All requests must include the header `Tus-Resumable: 1.0.0` (except `OPTIONS`).

---

### OPTIONS `/files` or `/files/{id}`
Discover server capabilities.

**Response:** `204 No Content`

| Response Header | Value |
|-----------------|-------|
| `Tus-Resumable` | `1.0.0` |
| `Tus-Version` | `1.0.0` |
| `Tus-Extension` | `creation,expiration,termination` |
| `Tus-Max-Size` | configured max file size |

---

### POST `/files`
Create a new upload session.

**Request Headers:**

| Header | Required | Description |
|--------|----------|-------------|
| `Tus-Resumable` | Yes | Must be `1.0.0` |
| `Upload-Length` | Yes | Total file size in bytes |
| `Upload-Metadata` | No | Base64-encoded metadata (e.g. filename, filetype) |

**Response:** `201 Created`

| Response Header | Description |
|-----------------|-------------|
| `Location` | URL of the created upload resource (`/files/{id}`) |

---

### PATCH `/files/{id}`
Append a chunk to an upload.

**Request Headers:**

| Header | Required | Description |
|--------|----------|-------------|
| `Tus-Resumable` | Yes | Must be `1.0.0` |
| `Upload-Offset` | Yes | Byte offset where this chunk starts |
| `Content-Type` | Yes | Must be `application/offset+octet-stream` |

**Request Body:** Binary chunk data

**Response:** `204 No Content`

| Response Header | Description |
|-----------------|-------------|
| `Upload-Offset` | New offset after appending the chunk |

---

### HEAD `/files/{id}`
Get the current status of an upload.

**Response:** `200 OK`

| Response Header | Description |
|-----------------|-------------|
| `Upload-Offset` | Number of bytes received so far |
| `Upload-Length` | Total expected file size |

---

### GET `/files/{id}`
Download a completed file. Supports partial content via the `Range` header.

**Request Headers:**

| Header | Required | Description |
|--------|----------|-------------|
| `Range` | No | Byte range, e.g. `bytes=0-1023` |

**Response:** `200 OK` or `206 Partial Content`

---

### DELETE `/files/{id}`
Terminate and remove an upload.

**Response:** `204 No Content`

---

## 16. Data Types & Enums

### `CourseLevel`
| Value | Description |
|-------|-------------|
| `BEGINNER` | Entry-level course |
| `INTERMEDIATE` | Mid-level course |
| `ADVANCED` | Advanced course |

### `GroupStatus`
| Value | Description |
|-------|-------------|
| `FORMING` | Group is being assembled |
| `ACTIVE` | Group is currently running |
| `FINISHED` | Group has completed |
| `CANCELLED` | Group was cancelled |

### `GroupScheduleType`
| Value | Description |
|-------|-------------|
| `EXACT_DAYS` | Runs on specific days of the week |
| `ODD_DAYS` | Runs on odd days of the month |
| `EVEN_DAYS` | Runs on even days of the month |

### `LessonSessionStatus`
| Value | Description |
|-------|-------------|
| `PLANNED` | Session is planned but not yet started |
| `DONE` | Session has been completed |
| `CANCELLED` | Session was cancelled |

### `LessonStatus`
| Value | Description |
|-------|-------------|
| `PLANNED` | Lesson is planned |
| `DONE` | Lesson is completed |
| `CANCELLED` | Lesson was cancelled |

### `AttendanceStatus`
| Value | Description |
|-------|-------------|
| `PRESENT` | Student was present |
| `ABSENT` | Student was absent |
| `LATE` | Student arrived late |
| `EXCUSED` | Student's absence was excused |

### `StudentStatus`
| Value | Description |
|-------|-------------|
| `ACTIVE` | Currently enrolled and active |
| `SUSPENDED` | Temporarily suspended |
| `GRADUATED` | Has graduated |

### `TeacherPosition`
| Value | Description |
|-------|-------------|
| `PROFESSOR` | Professor rank |
| `LECTURER` | Lecturer rank |
| `ASSISTANT` | Assistant rank |

### `EnrollmentStatus`
| Value | Description |
|-------|-------------|
| `ACTIVE` | Currently enrolled |
| `COMPLETED` | Completed the group |
| `DROPPED` | Dropped out |

### `DayOfWeek`
Standard Java `DayOfWeek` enum: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.

### `SystemRole`
| Value | Description |
|-------|-------------|
| `SUPER_ADMIN` | Full system access |
| `ADMIN` | Administrative access |
| `TEACHER` | Teacher access |
| `STUDENT` | Student access |
| `PARENT` | Parent access |
| `GUARDIAN` | Guardian access |
| `MAINTAINER` | Maintainer access |
| `SUPPORT_TEACHER` | Support teacher access |

### `UserStatus`
| Value | Description |
|-------|-------------|
| `ACTIVE` | Account is active |
| `INACTIVE` | Account is inactive |
| `BLOCKED` | Account is blocked |

### `Gender`
| Value |
|-------|
| `MALE` |
| `FEMALE` |

### `AttachmentType`
| Value | Description |
|-------|-------------|
| `IMAGE` | Image file |
| `VIDEO` | Video file |
| `AUDIO` | Audio file |
| `DOCUMENT` | Document file |
| `FILE` | Generic file |
| `OTHER` | Other file type |

### `SystemPermission`
Fine-grained permission codes assigned to roles.

| Value | Category | Description |
|-------|----------|-------------|
| `USER_CREATE` | USER | Create users |
| `USER_EDIT` | USER | Edit users |
| `USER_DELETE` | USER | Delete users |
| `USER_VIEW` | USER | View users |
| `COURSE_CREATE` | COURSE | Create courses |
| `COURSE_EDIT` | COURSE | Edit courses |
| `COURSE_DELETE` | COURSE | Delete courses |
| `COURSE_VIEW` | COURSE | View courses |
| `QUIZ_CREATE` | QUIZ | Create quizzes |
| `QUIZ_EDIT` | QUIZ | Edit quizzes |
| `QUIZ_DELETE` | QUIZ | Delete quizzes |
| `QUIZ_START` | QUIZ | Start a quiz |
| `QUIZ_EVALUATE` | QUIZ | Evaluate quiz results |
| `FILE_UPLOAD` | FILE | Upload files |
| `FILE_DELETE` | FILE | Delete files |
| `FILE_VIEW` | FILE | View/download files |

### `PermissionCategory`
Groups permissions by domain.

`SYSTEM` | `USER` | `COURSE` | `GROUP` | `LESSON` | `ATTENDANCE` | `ENROLLMENT`

---

## 17. Generic Response Wrappers

### `ApiResponse<T>`
Used for single-item responses.
```json
{
  "success": "boolean",
  "message": "string",
  "data":    "T"
}
```

### `ApiPaginateResponse<T>`
Used for paginated list responses.
```json
{
  "success": "boolean",
  "message": "string",
  "results": "T",
  "total":   "int",
  "page":    "int",
  "size":    "int",
  "hasNext": "boolean"
}
```

### `ApiErrorResponse`
Returned on errors.
```json
{
  "message":       "string",
  "httpStatus":    "HttpStatus",
  "localDateTime": "yyyy-MM-dd HH:mm:ss",
  "code":          "int"
}
```

---

## Security Summary

| Mechanism | Applied To |
|-----------|-----------|
| `@OpenAuth` (no JWT required) | `POST /auth/login`, `POST /auth/logout`, all `/files` TUS endpoints |
| JWT Bearer token | All other endpoints |
| `@PreAuthorize("hasAnyRole('SUPER_ADMIN')")` | `GET /user` |

**Soft delete:** All `DELETE` endpoints set `deleted = true` — records are not physically removed.

**Multipart endpoints:** `POST /user`, `PATCH /auth/me` (with images), all `/attachments` endpoints.
