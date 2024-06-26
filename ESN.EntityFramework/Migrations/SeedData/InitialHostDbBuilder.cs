﻿using ESN.EntityFramework;
using EntityFramework.DynamicFilters;

namespace ESN.Migrations.SeedData
{
    public class InitialHostDbBuilder
    {
        private readonly ESNDbContext _context;

        public InitialHostDbBuilder(ESNDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            _context.DisableAllFilters();

            new DefaultEditionsCreator(_context).Create();
            new DefaultLanguagesCreator(_context).Create();
            new HostRoleAndUserCreator(_context).Create();
            new DefaultSettingsCreator(_context).Create();
        }
    }
}
