get info on dotnet
`dotnet --info`

create new console project
`dotnet new console`

run project
`dotnet run`

start current project in vs code
`code .`

dotnet run does restore (get source code from Nuget) and build
`dotnet restore`
`dotnet build`

pass parameter from command line
`dotnet run -- Parameter`

create new xunit project in tests folder
`dotnet new xunit`

run test from GradeBook.Tests folder
`dotnet test`

add reference to another project (e.g. to main project in test project)
`dotnet add reference ../../src/GradeBook/GradeBook.csproj`

create solution file at gradebook:
`dotnet new sln`

add main and test project to solution
`dotnet sln add src/GradeBook/GradeBook.csproj
dotnet sln add test/GradeBook.Tests/GradeBook.Tests.csproj
`


```cs

```
