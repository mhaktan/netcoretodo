﻿using Todo.DataAccess.Infrastructure;
using System.Threading.Tasks;
using Todo.Domain;
using Todo.Core.Entities;
using Todo.Domain.ViewModels;

namespace Todo.DataAccess.CustomRepositories
{
    public interface IUserRepository : IGenericRepository<User>
    {
        Task<ServiceResult> SignInWithFormAsync(UserLoginViewModel userLoginViewModel);
        
        void RemoveOldRefreshTokensAsync(int userId);

        Task<ServiceResult> AddRefreshTokenAsync(UserRefreshToken userRefreshToken);

        Task<UserRefreshToken> GetUserRefreshTokensAsync(RefreshTokenViewModel refreshTokenVm);       
    }
}
