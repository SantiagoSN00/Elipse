# Use the official ASP.NET Core runtime as a base image
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine3.18-amd64 AS base
<<<<<<< HEAD
EXPOSE 5000
WORKDIR /app
# https://+:5005; if have certificate
ENV ASPNETCORE_URLS=http://+:5000
# Else will throw an error for localization
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
=======
# https://+:5005; if have certificate
ENV ASPNETCORE_URLS=http://+:5000
EXPOSE 5000
WORKDIR /app
>>>>>>> 50fcd9decefa47db444c37ec43301f68abbe8b61

# Copy the published application to the container
FROM mcr.microsoft.com/dotnet/sdk:8.0.100-1-alpine3.18-amd64 AS build
WORKDIR /src
COPY ["elipse.csproj", "./"]
RUN dotnet restore "elipse.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "elipse.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "elipse.csproj" -c Release -o /app/publish

# Build runtime image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "elipse.dll"]